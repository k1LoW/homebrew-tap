class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.2.5'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.5/octocov-cachegrind_v0.2.5_darwin_arm64.zip'
      sha256 'ddd056725d06cb6c42c68994adacfa29c032b2f07ea529a7374480d0f32a5bf0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.5/octocov-cachegrind_v0.2.5_darwin_amd64.zip'
      sha256 '031e1a5ee88b44fa9544e11db21e21f4285a49b12b7f12258fd3961342ed49b9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.5/octocov-cachegrind_v0.2.5_linux_arm64.tar.gz'
      sha256 '3800bfd1d43b4c9e61365709080f829cfc9ca90f144dd53d450a11a27e4d6eee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.5/octocov-cachegrind_v0.2.5_linux_amd64.tar.gz'
      sha256 'ac10bd8669681d71429c815150df8c5d94c420403a17a825dcb51370d1416184'
    end
  end

  head do
    url 'https://github.com/k1LoW/octocov-cachegrind.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octocov-cachegrind'
  end
end
