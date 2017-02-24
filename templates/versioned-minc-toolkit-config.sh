# minc-toolkit configuration parameters for 1.0.08-20160205

export MINC_TOOLKIT_VERSION="{{ minc_ver }}-{{ minc_date }}"
export PATH=/opt/minc-{{ minc_ver }}/bin:/opt/minc-{{ minc_ver }}/pipeline:${PATH}
export PERL5LIB=/opt/minc-{{ minc_ver }}/perl:/opt/minc-{{ minc_ver }}/pipeline:${PERL5LIB}
export LD_LIBRARY_PATH=/opt/minc-{{ minc_ver }}/lib:/opt/minc-{{ minc_ver }}/lib/InsightToolkit:${LD_LIBRARY_PATH}
export MNI_DATAPATH=/opt/minc-{{ minc_ver }}/share
export MINC_FORCE_V2=1
export MINC_COMPRESS=4
export VOLUME_CACHE_THRESHOLD=-1
export MANPATH=/opt/minc-{{ minc_ver }}/man:${MANPATH}

