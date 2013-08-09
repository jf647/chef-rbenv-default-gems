directory "#{node['rbenv']['root_path']}/plugins" do
  recursive true
end

git "#{node['rbenv']['root_path']}/plugins/rbenv-default-gems" do
  repository node['rbenv_default_gems']['git_url']
  reference node['rbenv_default_gems']['git_ref']

  if node['rbenv_default_gems']['upgrade_strategy'] == "none"
    action :checkout
  else
    action :sync
  end
end

template "#{node['rbenv']['root_path']}/default-gems" do
    action :nothing
    source "default-gems.erb"
end

accumulator "rbenv_default_gems" do
    target :template => "#{node['rbenv']['root_path']}/default-gems"
    filter do |res|
        res.is_a? Chef::Resource::RbenvDefaultGems
    end
    transform do |resources|
        gems = []
        resources.each do |r|
            if r.prerelease
                gems.push "#{r.name} --pre"
            elsif r.version
                gems.push "#{r.name} #{r.version}"
            else
                gems.push r.name
            end
        end
        gems
    end
end
