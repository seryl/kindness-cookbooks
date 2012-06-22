#
# Author:: Josh Toft <joshtoft@gmail.com>
# Cookbook Name:: emacs_config
# Recipe:: rinari
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

include_recipe "emacs_config::treetop"

template "#{ENV['HOME']}/.emacs.d/vendor/ruby-hacks.el" do
  source "ruby-hacks.el.erb"
end

emacs_module "rinari.el" do
  type "template"
  source "rinari.el.erb"
end

vendor_module "rinari" do
  type "git"
  source "https://github.com/eschulte/rinari.git"
end
