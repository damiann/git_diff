require 'spec_helper'

RSpec.describe 'git' do
  let(:test_files) { File.expand_path(File.join(File.expand_path(__dir__), 'files')) }
  let(:git) { Git.open(working_dir) }

  # Avoid warnings about embedded git repository
  before { FileUtils.mv(File.join(working_dir, 'test.git'), File.join(working_dir, '.git')) }

  after { FileUtils.mv(File.join(working_dir, '.git'), File.join(working_dir, 'test.git')) }

  describe 'adding new string' do
    let(:working_dir) { File.expand_path(File.join(test_files, 'yaml_add_string')) }

    it 'should have a diff' do
      diff = git.diff
      expect(diff.size).to eq(1)
      expect(diff.insertions).to eq(4)
    end
  end
end
