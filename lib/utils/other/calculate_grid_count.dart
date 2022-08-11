List<int> getCrossAndMain(int width){
  if(width < 480){
    return [(4/2).round(),3];
  }else{
    return [4,3];
  }
}
