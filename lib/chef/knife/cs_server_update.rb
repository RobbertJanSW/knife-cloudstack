#
# Author:: Robbert-Jan Sperna Weiland (<rspernaweiland@schubergphilis.com>)
# Copyright:: Copyright (c) 2018 Robbert-Jan Sperna Weiland.
# License:: Apache License, Version 2.0
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
#

require 'chef/knife/cs_base'
require 'chef/knife/winrm_base'

module KnifeCloudstack
  class CsServerUpdate < Chef::Knife

    include Chef::Knife::KnifeCloudstackBase

    deps do
      require 'chef/knife'
      require 'chef/json_compat'
      require 'knife-cloudstack/connection'
      require 'httpclient'
    end

    banner "knife cs server update [SERVER_NAME] (options)"

    def run
      validate_base_options

      params = {}
      while arg = @name_args.shift do
        arg_split = arg.split("=")
        params[arg_split[0]] = arg_split[1]
      end

      @server = connection.server_update(params)
    end

  end
end
