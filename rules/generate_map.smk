rule separate_chromosomes:
    input:
        "data_f.call.gz"
    output:
        "maps.splitchrom/map.{lod_range}"
    log:
        "maps.splitchrom/logs/map.{lod_range}.log"
    message:
        """
        Creating map for lodLimit={params.lod} >> maps.splitchrom/map.{params.lod}
        """
    threads: sepchrom_threads
    params:
        lod = "{lod_range}",
        dist_lod = "distortionLod=1",
    shell:
        """
        zcat {input} | java -cp LM3 SeparateChromosomes2 data=- sizeLimit=5 {informative} lodLimit={params.lod} {params.dist_lod} numThreads={threads} > {output} 2> {log}
        """

rule map_summary:
    input:
        expand("maps.splitchrom/map.{LOD}", LOD = lod_range)
    output:
        "maps.splitchrom/maps.summary.txt"
    message:
        """
        Combining map summaries >> maps.splitchrom/maps.summary.txt
        """
    params:
        lod_max = lod_max
    shell:
        "scripts/map_summary.sh maps.splitchrom {params.lod_max}"

rule join_singles:
    input:
        datacall = "data_f.call.gz",
        map_summ = "maps.splitchrom/maps.summary.txt"
    output:
        "map.master"
    log:
        "maps.splitchrom/chosen.map"
    threads: sepchrom_threads
    params:
        lod_limit = lod_lim,
        lod_diff = lod_diff,
        iterate = "iterate=1",
    shell:
        """
        echo -n -e '\nWhich map would you like to use (e.g. map.15)? map.'
        read -r
        echo "map.$REPLY" > {log}
        zcat {input.datacall} | java -cp LM3 JoinSingles2All map=maps.splitchrom/map.$REPLY data=- {params.lod_limit} {params.lod_diff} {params.iterate} numThreads={threads} > {output}
        echo "Your filtered map can be found in the working directory as {output}"
        echo "A record of your choice can be found in {log}"
        sleep 5s
        """
