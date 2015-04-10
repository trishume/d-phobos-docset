task :download do
  sh "wget --recursive --page-requisites --html-extension --convert-links --restrict-file-names=windows --domains dlang.org --no-parent http://dlang.org/phobos/"
  mkdir_p "D.docset/Contents/Resources/"
  mv "dlang.org", "D.docset/Contents/Resources/Documents"
end

SQLITE_DB = "D.docset/Contents/Resources/docSet.dsidx"
task :gen do
  ruby "gen.rb D.docset/Contents/Resources/Documents/phobos D.docset/Contents/Resources/Documents"
  rm SQLITE_DB if File.exist?(SQLITE_DB)
  sh "sqlite3 #{SQLITE_DB} < index.sql"
end
