require 'test_helper'

class RiiifTest < ActionDispatch::IntegrationTest
  test 'can return image info' do
    get '/image-service/dz%2F302%2Fgz%2F2129%2FPC0082_b06_f01_Baseball_1986_0012.jp2/info.json'
    assert_response :ok
    assert_equal('{"width":6501,"height":4381,'\
                  '"@context":"http://iiif.io/api/image/2/context.json",' \
                  '"@id":"http://www.example.com/image-service/dz%2F302%2Fgz%2F2129%2FPC0082_b06_f01_Baseball_1986_0012.jp2",'\
                  '"protocol":"http://iiif.io/api/image",'\
                  '"profile":["http://iiif.io/api/image/2/level1.json",'\
                  '{"formats":["jpg","png"]}]}', response.parsed_body)
  end

  test 'can return an image' do
    get '/image-service/dz%2F302%2Fgz%2F2129%2FPC0082_b06_f01_Baseball_1986_0012.jp2/full/!150,300/0/default.jpg'
    assert_response :ok

    Tempfile.open('test', encoding: 'ascii-8bit') do |f|
      f.write response.body
      f.rewind
      _, format, dimensions, _ = `identify #{f.path}`.split(/\s+/)
      assert_equal 'JPEG', format
      assert_equal '150x101', dimensions
    end
  end

  test 'requires an appropriate image extension' do
    assert_raises ArgumentError do
      get '/image-service/dz%2F302%2Fgz%2F2129%2FPC0082_b06_f01_Baseball_1986_0012.txt/full/!150,300/0/default.jpg'
    end
  end

  test 'prevents directory traversal' do
    assert_raises ArgumentError do
      get '/image-service/..%2F..%2Fetc%2Fpasswd.jp2/full/!150,300/0/default.jpg'
    end
  end
end
