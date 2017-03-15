class SearchResult extends React.Component {

  constructor(props){
    super(props);
  }

  render(){
    return (
      <li className="collection-item avatar">
      <img src={this.props.data.Poster} alt="" className="circle" />
      <span className="title"><a href={"/movies/" + this.props.data.id}>{this.props.data.Title}</a> </span>
      <a href="#watch_list_create_path" className="secondary-content"><i className="material-icons">library_add</i></a>
      </li>
    )
  }

}
