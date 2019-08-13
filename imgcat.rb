class Imgcat < Formula
  desc 'Displays one or more images inline at their full size.'
  homepage 'https://www.iterm2.com/documentation-images.html'
  version '1.0.0'

  url 'https://iterm2.com/utilities/imgcat'
  sha256 'b8fd783db29dbdd8a84beabbc251544dcc26bafad3b20c9ff32db7e8c7cd2869'

  def install
    bin.install 'imgcat'
  end
end
