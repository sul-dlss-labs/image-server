require 'test_helper'

class RiiifTest < ActionDispatch::IntegrationTest
  test 'can return image info' do
    get '/image-service/dz302gz2129/info.json'
    assert_response :ok
    assert_equal('{"width":6501,"height":4381,'\
                  '"@context":"http://iiif.io/api/image/2/context.json",' \
                  '"@id":"http://www.example.com/image-service/dz302gz2129",'\
                  '"protocol":"http://iiif.io/api/image",'\
                  '"profile":["http://iiif.io/api/image/2/level1.json",'\
                  '{"formats":["jpg","png"]}]}', response.parsed_body)
  end

  test 'can return an image' do
    get '/image-service/dz302gz2129/full/!150,300/0/default.jpg'
    assert_response :ok
    assert_equal(4816, response.body.size)
  end
end
