if ARGV.delete("--version")
  STDOUT.puts "align-equals " + {{`(grep '^version:' shard.yml | cut -d':' -f2 2>/dev/null) || true`.stringify.strip}}
  exit
end

buffer = ARGF.gets_to_end

l_max = r_max = 0

regex = /^(\s*?)([^\n]+?)\s*?=(>?)[ \t]*([^#]+?)\s*?(#.*?)?$/m

buffer.scan(regex) do |m|
  l_max = [l_max, m[2].size].max
  r_max = [r_max, m[4].size].max
end

buffer = buffer.gsub(regex) do |s, m|
  if m[5]?
    "%s%-#{l_max}s =%s %-#{r_max}s %s" % [m[1], m[2], m[3], m[4], m[5]]
  else
    "%s%-#{l_max}s =%s %s" % [m[1], m[2], m[3], m[4]]
  end
end

puts buffer
