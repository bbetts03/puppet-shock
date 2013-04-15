
class shock {
  include shock::users, shock::mysql, shock::blogs, shock::packages

  #Note that password and username are specific to each object
  group { "puppet":
    ensure => "present",
  }

  include nginx
  include phpfpm
  include iptables
  include selinux
  include awstats

}

include shock

