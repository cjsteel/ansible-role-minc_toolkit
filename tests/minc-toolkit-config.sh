# minc-toolkit configuration parameters for 1.0.08-20160205

export MINC_TOOLKIT_VERSION="{{ minc_ver }}-{{ minc_date }}"
export PATH=/opt/minc/bin:/opt/minc/pipeline:${PATH}
export PERL5LIB=/opt/minc/perl:/opt/minc/pipeline:${PERL5LIB}
export LD_LIBRARY_PATH=/opt/minc/lib:/opt/minc/lib/InsightToolkit:${LD_LIBRARY_PATH}
export MNI_DATAPATH=/opt/minc/share
export MINC_FORCE_V2=1
export MINC_COMPRESS=4
export VOLUME_CACHE_THRESHOLD=-1
export MANPATH=/opt/minc/man:${MANPATH}

