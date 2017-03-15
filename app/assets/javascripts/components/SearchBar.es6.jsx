class SearchBar extends React.Component {

  constructor(props){
    super(props);
    this.state = {value: ''};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event){
    this.setState({value: event.target.value});
  }

  handleSubmit(event){
    event.preventDefault();
    $.ajax({
      url: "/search",
      method: "POST",
      data: {searchResult: this.state.value}
    })
    .done(function(response){
      this.props.addResult(response);
    }.bind(this))
    .fail(function(response){
      // console.log(response)
    })
  }

  render(){
    return (
      <section>
        <h3>Search for a movie</h3>
          <form id="search-form" onSubmit={this.handleSubmit} action="/search" method="POST">
            <label name="search_form">Search Form</label>
            <input type="text" name="search_form" onChange={this.handleChange}></input>
            <input type="submit" value="Search"></input>
          </form>
      </section>
    )
  }



}
