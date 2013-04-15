

define awstats::config(
    $domain,
    $skiphosts,
    $skipfiles,
    $domain_alias,
){

    file{"/etc/awstats/awstats.${domain}.conf":
        ensure=>present,
        content => template("awstats/awstats.conf.erb")
    }



}
