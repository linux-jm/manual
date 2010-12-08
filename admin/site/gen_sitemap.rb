#!/usr/bin/env ruby

require 'find'

$site_url = "http://linuxjm.sourceforge.jp"

def usage
  puts "Usage: #{$0} <htdocs_path> ...."
end

if ARGV.size == 0
  usage
  exit 1
end

puts "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
puts "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">"

ARGV.each do |param|
  folder_path = param.to_s
  Find.find("#{folder_path}") do |file|
    path = file.gsub("#{folder_path}/", "")
    if path =~ /\.html$/ && !(path =~ /^google.*\.html/)
      mod_date = File.ctime(file)
      puts "\
	<url>
		<loc>#{$site_url}/#{path}</loc>
		<lastmod>#{mod_date.strftime("%Y-%m-%d")}</lastmod>
		<changefreq>daily</changefreq>
	</url>"
    end
  end
end

puts "</urlset>"
