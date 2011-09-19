# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simply_edit/version"

Gem::Specification.new do |s|
  s.name        = "simply_edit"
  s.version     = SimplyEdit::VERSION
  s.authors     = ["Firebait"]
  s.email       = ["marcotapiag@gmail.com"]
  s.homepage    = "http://firebait.com"
  s.summary     = %q{Rails gem that makes updating a field from a database via ajax simply by converting a link into a texfield, textarea or a datefield. Useful for making editable labels.}
  s.description = %q{Rails gem that makes updating a field from a database via ajax simply by converting a link into a texfield, textarea or a datefield.}

  s.rubyforge_project = "simply_edit"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency('jquery-rails')
end
