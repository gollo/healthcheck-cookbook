require 'chefspec'

describe 'healthcheck::http' do

  let(:cookbook_paths) {
    [ 
      ::File.realpath(::File.join(::File.dirname(__FILE__), '../../..')),
      ::File.realpath(::File.join(::File.dirname(__FILE__), '../cookbooks'))
    ]
  }

  let(:runner) { 
    ChefSpec::ChefRunner.new(:cookbook_path => cookbook_paths, 
      :step_into => ['healthcheck::http']) 
  }

  it 'Doesn\'t barf' do
    runner.converge 'fixtures::http_basic'
  end
end
