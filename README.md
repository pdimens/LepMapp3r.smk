![logo](.misc/logo.png)

_It's Lep-Map3 and Lep-Anchor, but with snakes 🐍🐍_

[![alt text](https://img.shields.io/badge/docs-wiki-75ae6c?style=for-the-badge&logo=Read%20The%20Docs)](https://github.com/pdimens/LepWrap/wiki) 
[![Cite](https://img.shields.io/badge/Cite-10.5281/zenodo.6055566-e1e1e1?style=for-the-badge)](https://zenodo.org/badge/latestdoi/260516189) 
# LepWrap

LepWrap is a reusable pipeline to use the linkage map software [Lep-Map3](https://sourceforge.net/projects/lep-map3/) and the genome assembly map-based anchoring and orienting software [Lep-Anchor](https://sourceforge.net/p/lep-anchor/wiki/Home/). Check out [the documentation/wiki](https://github.com/pdimens/LepWrap/wiki) for detailed installation, usage, and workflow information.

### How to install
You will need a `conda` installation ([Anaconda](https://docs.anaconda.com/anaconda/install/) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html), I recommend Miniconda). Alternatively, you can download latest release or clone this repository locally.

#### 1. The Easy Way™️
Create an environment called `lepwrap` and install `LepWrap` into it in a single command.
```bash
conda create -n lepwrap -c bioconda lepwrap
```
Activate the environment with `conda activate lepwrap`

#### 2. The Other Way
##### 2.1 Cloning LepWrap
Download a zip of this repository using the "Code" button on the top-right and unzip it on your machine or:
```bash
git clone https://github.com/pdimens/LepWrap.git
```

##### 2.2 Installing everything
Assuming you have `anaconda` or `miniconda` installed:
```bash
cd LepWrap
conda env create -f conda_setup.yml
```
This will create an environment called `lepwrap` that can be activated with:
```bash
conda activate lepwrap
```
Then, install all the software dependencies into the environment's path with 
```bash
.misc/install.sh
```

### How to run
You will need to modify `config.yml` to suit your needs, then you can simply run the pipeline with the wrapper:
```bash
LepWrap <number_of_cores> <config.yml>
```
where `<number_of_cores>` is an integer of the maximum number of cores/threads you want the pipeline to use and `<config.yml>` (optional!) is the name of the config file, if it's different than `config.yml`. If no config file is found in the directory, LepWrap will generate a default one for you to edit.

**Examples**
```bash
LepWrap 15                    # assumes config.yml
LepWrap 32 nojoinsingles.yml  # specific config file
```
### Something to keep in mind
LepWrap does things a certain way, employing the most common/reasonable way of using Lep-Map3 (and LepAnchor more or less). Current versions are **a lot** more flexible that the predecessors, but might still lack something you need. Your study is unique, and I encourage you to clone/fork this repository and adapt LepWrap to it! All of the code in LepWrap is written in human-readable bash or aggressively annotated R, so give it a shot and adapt it to your workflow. PR's always welcome!


## Citation
If using LepWrap in a publication, cite **Pasi Rastas** for their work on Lep-Map3/Lep-Anchor and cite this repository using the Zenodo citation. You are also encouraged to cite LepWrap if you just use the edge-trimming part of it. If you like LepWrap, please Star the repository and/or give me (Pavel) a shout out on Twitter [@pvdimens](https://twitter.com/PVDimens) [![alt text](http://i.imgur.com/wWzX9uB.png)](https://twitter.com/PVDimens)  =)

> Pavel V. Dimens. (2022). pdimens/LepWrap: link with zenodo (3.6.2). Zenodo. https://doi.org/10.5281/zenodo.6055566

> Pasi Rastas, Lep-MAP3: robust linkage mapping even for low-coverage whole genome sequencing data, Bioinformatics, Volume 33, Issue 23, 01 December 2017, Pages 3726–3732,https://doi.org/10.1093/bioinformatics/btx494

> Pasi Rastas, Lep-Anchor: automated construction of linkage map anchored haploid genomes, Bioinformatics, Volume 36, Issue 8, 15 April 2020, Pages 2359–2364, https://doi.org/10.1093/bioinformatics/btz978
