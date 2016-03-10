guard :minitest do
  ignore(%r{^test/(fixtures|coverage)})

  watch(%r(^test/(.*)\/?(.*)_test\.rb$))
  watch(%r(^lib/(.*/)?([^/]+)\.rb$))     { |m| "test/#{m[1]}#{m[2]}_test.rb" }
  watch(%r(^test/test_helper\.rb$))      { 'test' }
end

guard :rubocop do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end
