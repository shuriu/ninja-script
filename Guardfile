guard :minitest do
  ignore(%r{^test/(fixtures|coverage)})
  watch(%r(^test/(.*)\/?(.*)_test\.rb$))
  watch(%r(^lib/(.*/)?([^/]+)\.rb$))     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r(^test/test_helper\.rb$))      { 'test' }
end
