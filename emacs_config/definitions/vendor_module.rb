#
# Author:: Josh Toft <joshtoft@gmail.com>
# Cookbook Name:: emacs_config
# Recipe:: vendor_module
#
# Copyright 2012, Josh Toft
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

define :vendor_module do
  mod = params[:name].to_s
  source_type = params[:type]
  source = params[:source]
  module_dir = "#{ENV['HOME']}/.emacs.d/vendor"
  unless params[:append].nil?
    append = params[:append]
  else
    append = true
  end
  
  unless node['emacs']['vendor'].include? mod
    node['emacs']['vendor'] << mod if append
  end
  
  case source_type
  when "git"
    git "#{module_dir}/#{mod}" do
      repository source
      action :sync
      revision params[:revision]
    end
  when "file"
    cookbook_file "#{module_dir}/#{mod}" do
      source source
      mode 00644
    end
  when "template"
    template "#{module_dir}/#{mod}" do
      source source
      mode 00644
    end
  end
end
