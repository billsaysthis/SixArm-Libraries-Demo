
settings = YAML::load_file("#{Rails.root}/config/settings.yml")
gls = settings['gemlists']

GEMLISTS = Hash.new
gls.each do |gl|
  glh = Hash.new
  gl.last.each do |gh|
    glh[gh.first[0]] = gh.first[1]
  end
  
  GEMLISTS[gl.first.to_sym] = glh
end

