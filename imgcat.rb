class Imgcat < Formula
  desc 'Displays one or more images inline at their full size.'
  homepage 'https://www.iterm2.com/documentation-images.html'
  version '1.0.0'

  url 'https://iterm2.com/utilities/imgcat'
  sha256 '49945beb679baaccfc089d2f3e57c0aedeb4f6bf4c7c53ca261ad664018edab4'

  def install
    bin.install 'imgcat'
  end
end
