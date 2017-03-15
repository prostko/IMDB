class SearchContainer extends React.Component {

  constructor(props){
    super(props);
    this.state = {searchResults: []}
  }

  render(){
    // debugger
    return (
      <div>
        <h1>Movies</h1>
          <ul className="collection">
            {
              this.props.searchResults.map((data, i) =>{
                return <SearchResult data={data} key={i}/>
              })
            }
          </ul>
      </div>
    )
  }


}
