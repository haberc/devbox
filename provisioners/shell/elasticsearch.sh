#install elasticsearch

es_path=/usr/local/lib/elasticsearch
es_config_path=/usr/local/etc/elasticsearch/elasticsearch.yml

if [ ! -d /usr/local/lib/elasticsearch ] ; then
    pkg install -y elasticsearch2

    mv $es_config_path $es_config_path.clean

    mkdir $es_path/logs && chown elasticsearch:elasticsearch $es_path/logs
    mkdir $es_path/data && chown elasticsearch:elasticsearch $es_path/data

    # make ES available from outside the box (this is not secure at all, do not so this in production)
    echo 'network.host: 0.0.0.0' >> $es_config_path

    # give the cluster (of one node) a name so it doesn't join other clusters on the network
    echo 'cluster.name: "who_needs_clusters_anyway"' >> $es_config_path
fi

if ! grep -Fxq 'elasticsearch_enable="YES"' /etc/rc.conf ; then
    echo 'elasticsearch_enable="YES"' >> /etc/rc.conf
    service elasticsearch start
fi
