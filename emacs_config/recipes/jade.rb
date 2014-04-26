#
# Author:: Josh Toft <joshtoft@gmail.com>
# Cookbook Name:: emacs_config
# Recipe:: jade
#
# Copyright 2014, Josh Toft
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

emacs_module "jade.el" do
  type "template"
  source "jade.el.erb"
end

vendor_module "jade" do
  type "git"
  source "https://github.com/brianc/jade-mode.git"
  append false
  revision "d2c37c960b60fe3d173126f3b24770fd2d51263e"
end
