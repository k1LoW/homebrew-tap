class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.9'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.9/octocov-runn-coverage_v0.1.9_darwin_arm64.zip'
      sha256 '8ff2bd62798e71c8887c1a77ede1fccde2c51425bf131f2c7d40506314af7108'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.9/octocov-runn-coverage_v0.1.9_darwin_amd64.zip'
      sha256 'bdd6ddd1efc79b20024bef72b2e7c1c1b23180a10c34e5624353c647c3261aaa'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.9/octocov-runn-coverage_v0.1.9_linux_arm64.tar.gz'
      sha256 'e24464ea3542c1f359ed3a5d2640ba8d24cb68dbb83ad71d182ca0a1fdb455d2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.9/octocov-runn-coverage_v0.1.9_linux_amd64.tar.gz'
      sha256 '9bdb373a4c920bc35b210b03aac2ae34536969296b67f774465207982a9ba7d8'
    end
  end

  head do
    url 'https://github.com/k1LoW/octocov-runn-coverage.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octocov-runn-coverage'
  end
end
