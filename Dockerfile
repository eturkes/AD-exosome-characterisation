# Copyright 2019-2020 Emir Turkes, Guar Pallavi, Stephanie Fowler, UK DRI at UCL, Columbia
# University Medical Center
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM rocker/rstudio:3.6.1

LABEL maintainer="Emir Turkes emir.turkes@eturkes.com"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        zlib1g-dev \
        libpng-dev \
        libnetcdf-dev \
        libxml2-dev \
        libproj-dev \
    && Rscript -e "install.packages('conflicted')" \
        -e "install.packages('rmarkdown')" \
        -e "install.packages('rprojroot')" \
        -e "install.packages('DT')" \
        -e "install.packages('data.table')" \
        -e "install.packages('readxl')" \
        -e "install.packages('pheatmap')" \
        -e "install.packages('plyr')" \
        -e "install.packages('UpSetR')" \
        -e "install.packages('dplyr')" \
        -e "install.packages('hexbin')" \
        -e "install.packages('BiocManager')" \
        -e "install.packages('devtools')" \
        -e "BiocManager::install('DEP')" \
        -e "BiocManager::install('GSVA')" \
        -e "BiocManager::install('variancePartition')" \
        -e "BiocManager::install('EnhancedVolcano')" \
        -e "devtools::install_github('kevinblighe/EnhancedVolcano')" \
    && apt-get clean \
    && rm -Rf /var/lib/apt/lists/ \
        /tmp/downloaded_packages/ \
        /tmp/*.rds

COPY user-settings /home/rstudio/.rstudio/monitored/user-settings/
