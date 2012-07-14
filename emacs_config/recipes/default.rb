#
# Author:: Josh Toft <joshtoft@gmail.com>
# Cookbook Name:: emacs_config
# Recipe:: default
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

include_recipe "emacs"

directory "#{ENV['HOME']}/.emacs.d"
directory "#{ENV['HOME']}/.emacs.d/vendor"
directory "#{ENV['HOME']}/.emacs.d/#{ENV['USER']}"

# Personal
include_recipe "emacs_config::defuns"
include_recipe "emacs_config::global"
include_recipe "emacs_config::theme"
include_recipe "emacs_config::temp_files"

# Vendor
include_recipe "emacs_config::color-theme"
include_recipe "emacs_config::magit"
include_recipe "emacs_config::dired"
include_recipe "emacs_config::erlang"
include_recipe "emacs_config::distel"
# include_recipe "emacs_config::gist"
include_recipe "emacs_config::markdown-mode"
include_recipe "emacs_config::mustache-mode"
include_recipe "emacs_config::scss-mode"
include_recipe "emacs_config::textmate"
include_recipe "emacs_config::rinari"
include_recipe "emacs_config::python"
include_recipe "emacs_config::twilight-emacs"
include_recipe "emacs_config::yaml-mode"

template "#{ENV['HOME']}/.emacs.el" do
  source "emacs.el.erb"
end

template "#{ENV['HOME']}/.emacs.d/#{ENV['USER']}.el" do
  source "personal.el.erb"
end

bash "setup local.el" do
  code <<-EOH
  echo "(load \\"#{ENV['USER']}\\")\n" > #{ENV['HOME']}/.emacs.d/local.el
  EOH
  not_if { ::File.exists?("#{ENV['HOME']}/.emacs.d/local.el") }
end
