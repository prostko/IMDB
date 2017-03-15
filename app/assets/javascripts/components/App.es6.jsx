class App extends React.Component {
  constructor(props){
    super(props);
    this.state = {searchResults: []};

    this.addResult = this.addResult.bind(this);
  }

  addResult(result){

    this.setState({searchResults: result})
  }

  render() {

    return(
      <section className="app-container">
        <SearchBar addResult={this.addResult} />
        <SearchContainer searchResults={this.state.searchResults} />
      </section>
    )
  }

}
