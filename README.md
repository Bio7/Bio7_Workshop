# Bio7 Workshop 2015

ImageJ User &amp; Developer Conference 2015: http://imagej.net/Conference_2015

## Title:
**Bio7 – Statistical image analysis and reproducible reports with ImageJ and R**

## Requirements

### Bio7

**Bio7 2.3 - now available here: http://sourceforge.net/projects/bio7/**

#### Bio7 Installation:

Simply unzip the archive of Bio7 2.3 (Windows, Linux) in your preferred OS location. The MacOSX version can be installed easily with the available *.dmg file installer. 

To start the application simply double click on the  Bio7 binary file.

#### Eclipse GIT plugin installation

You can download and update this repository if you install the Eclipse GIT plugin into Bio7:

Help->Install New Software...->Select Eclipse Mars repository->Collaboration->Select 'Eclipse GIT Team Provider'
see: https://youtu.be/W15SUGBmG3M

#### R and Rserve installation

**The Windows version of Bio7 is bundled with R and Rserve. No extra installation is needed.**

**For Linux and MacOSX R and Rserve has to be installed!** Bio7 will fetch the default paths from the OS System PATH (so hopefully no other adjustments have to be made).

**Download R at: https://www.r-project.org/**

**Rserve** has to be available in cooperative mode which can be installed from the Bio7 Bitbucket website from within R with:

**MacOSX:**

Open R and type:

    install.packages("https://bitbucket.org/maustenfeld/bio7-new/downloads/Rserve_1.8-4_Mac_cooperative.tgz", repos=NULL)

**Linux (compiled with Linux Mint 17.2):**

Open R and type:

    install.packages("https://bitbucket.org/maustenfeld/bio7-new/downloads/Rserve_1.8-4_Linux_cooperative.tar.gz", repos=NULL)

### R packages

For this workshop you have to install some R packages which will be used during the workshop.

#### Needed R packages:

**knitr** package: http://yihui.name/knitr/

**spatstat** package: http://spatstat.github.io/

#### Extra R packages:

**formatR** package: https://cran.r-project.org/web/packages/formatR/index.html

**rmarkdown** package: http://rmarkdown.rstudio.com/  (pandoc installation required - see Special Software!)

**rgdal** package: https://cran.r-project.org/web/packages/rgdal/index.html

**maptools** package: https://cran.r-project.org/web/packages/maptools/index.html

**sp** package: https://cran.r-project.org/web/packages/sp/index.html

**raster** package: https://cran.r-project.org/web/packages/raster/index.html

**ggplot2** package: http://ggplot2.org/

#### Installation R packages:

You can install the packages e.g. with the following script (you can find the R script in the repository, too):

    packagesIJWorkshop<-c("knitr","formatR","rmarkdown","sp", "maptools", "rgdal", "spatstat","raster","ggplot2")
    install.packages(packagesIJWorkshop, dep=TRUE, repos="http://cran.us.r-project.org")

**Linux only:** Note that the R packages for Linux will be compiled. An installation of 'gfortran' and 'g++' is necessary if not by default. For the packages 'spatstat' and 'rgdal' the following Linux libraries have to be installed, too.

GDAL: gdal,libgdal-dev,libproj-dev

spatstat: libblas-dev,liblapack

### Special Software

For the **rmarkdown** package **pandoc** (http://pandoc.org/) has to be installed.

Download at: https://github.com/jgm/pandoc/releases/latest

After the binary installation it is often necessary to update the search path in R to include
the installation directory of pandoc.

**MacOSX** Add to the OS PATH. Else type in the R console: 

    Sys.setenv(PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin")

or with the LaTeX path added:

    Sys.setenv(PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Library/TeX/texbin:$HOME/bin")

**Linux** After installation available. Else type in the R console: 

    Sys.setenv(PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin")

**Windows** Add pandoc path to the Windows PATH variable (evtl restart). Else type in the R console: 

    Sys.setenv(PATH=paste(Sys.getenv("PATH"),"C:/pandoc", sep=""))


The commands can be copied and saved for each startup (only if necessary) in the R preferences textfield:

**R->Preferences->Rserve Preferences->R startup commands**

### LaTeX

To use LaTeX with Bio7 please install a LaTeX environment e.g. 

Windows: MiKeTX (http://miktex.org/)

MacOSX:  MacTeX (https://tug.org/mactex/)

Linux:   TeX Live (http://www.tug.org/texlive/)

Then adjust the Bio7 path to the pdflatex binary (only necessary if not on the OS path!):

**R->Preferences->Rserve preferences->pdflatex path**

To get the installation location folder on Linux or on MacOSX type: 

    which pdflatex

For Windows MikeTeX pdflatex can be typically found at:

    C:\Program Files (x86)\MiKTeX 2.9\miktex\bin

## Links:

Bio7: http://bio7.org

spatstat website: http://spatstat.github.io/

spatstat workshop notes: https://research.csiro.au/software/r-workshop-notes/

R Markdown: http://rmarkdown.rstudio.com/

useR R markdown tutorial: https://github.com/daroczig/user2015-markdown-tutorial


