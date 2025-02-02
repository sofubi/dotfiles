function gi -d "Fetch specified gitignore"
  curl -sL https://www.toptal.com/developers/gitignore/api/$argv
end
