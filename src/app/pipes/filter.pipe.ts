import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filter'
})
export class FilterPipe implements PipeTransform {
  
  
  transform(value: any, arg: any): any {
    if (arg === ''|| arg.length < 2) return value;
    const resultPost = [];
    for(const ed of value){
      if(ed.egresado_nombre.toLowerCase().indexOf(arg)> -1){
        resultPost.push(ed)
      }if(ed.egresado_codigo.toLowerCase().indexOf(arg)> -1){
        resultPost.push(ed)
      }if(ed.egresado_ap_paterno.toLowerCase().indexOf(arg)> -1){
        resultPost.push(ed)
      }if(ed.egresado_ap_materno.toLowerCase().indexOf(arg)> -1){
        resultPost.push(ed)
      }
      if(ed.egresado_sexo.toLowerCase().indexOf(arg)> -1){
        resultPost.push(ed)
      }
      
    }
    return resultPost;
  }
  

}
