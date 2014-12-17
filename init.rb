require 'autoproj/gitorious'

#without this variable beeing set autoproj will complain:
#
#   in /home/mzenzes/TransTerrA/rock-trusty-amd64/autoproj/overrides.yml: the source specification {:github=>"rock-core/package_set"} misses either the VCS type or an URL
#
# but later autoproj seems to know about github and gitorious and asks for method of access...
Autoproj.gitorious_server_configuration('GITHUB', 'github.com', :http_url => 'https://github.com')
