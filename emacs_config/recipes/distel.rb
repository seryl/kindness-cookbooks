#
# Author:: Josh Toft <joshtoft@gmail.com>
# Cookbook Name:: emacs_config
# Recipe:: distel
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

include_recipe "emacs_config::erlang"

vendor_module "distel.el" do
  type "git"
  source "https://github.com/massemanet/distel.git"
end

template "#{ENV['HOME']}/.emacs.d/vendor/distel.el/distel.el" do
  source "distel_loader.el.erb"
end

bash "setup distel.el" do
  code <<-EOH
  cd #{ENV['HOME']}/.emacs.d/vendor/distel.el
  make
  EOH
  not_if { ::File.exists?("#{ENV['HOME']}/.emacs.d/vendor/distel.el/ebin") }
end
