require "nokogiri"

basedir = ARGV.shift
reldir = ARGV.shift

out = File.open("index.sql","w")
out.puts "CREATE TABLE IF NOT EXISTS searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT);"
out.puts "CREATE UNIQUE INDEX anchor ON searchIndex (name, type, path);"
Dir[File.join(basedir,"*")].each do |f|
  doc = Nokogiri::HTML(IO.read(f))
  page_name = doc.at_css(".hyphenate > h1").text
  relpath = f[reldir.length+1..-1]
  out.puts "INSERT OR IGNORE INTO searchIndex(name, type, path) VALUES ('#{page_name}', 'Module', '#{relpath}');"
  doc.css(".d_decl > .ddoc_psymbol").each do |el|
    name = el.text
    out.puts "INSERT OR IGNORE INTO searchIndex(name, type, path) VALUES ('#{name}', 'Function', '#{relpath}#.#{name}');"
  end
end
