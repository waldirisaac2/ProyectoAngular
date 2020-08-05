import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { CursosService } from '../services/cursos.service';
import { MedioService } from '../services/medio.service';


@Component({
  selector: 'app-curso-index',
  templateUrl: './curso-index.component.html',
  styleUrls: ['./curso-index.component.css']
})
export class CursoIndexComponent implements OnInit {

  list;
  list2;
  CursoForm: FormGroup;
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private cursosservice: CursosService,
    private formBuild: FormBuilder,
    private medio: MedioService,
 
  ) {
    this.getList();
    this.getList2();
  }
  ngOnInit() {
        this.getList();
        this.getList2();
        this.CursoForm = this.formBuild.group({
      
          cursos_id: [''],
          cursos_nombre: ['', [Validators.required]],
          curso_lugar: ['', [Validators.required]],
          curso_fecha: ['', [Validators.required]],
          egresado_id: ['', [Validators.required]],
        });

    let cursos_id = this.route.snapshot.paramMap.get('id');
    if (cursos_id != null) {
      this.cursosservice.getById(cursos_id).subscribe(response => {
        this.CursoForm.setValue(response);
        console.log(response);
      });
    }
  
  }
  private getList2() {
    this.medio.getList().subscribe(response => {
      this.list2=response;
      console.log(this.list2);
    });
  }
  save() {
    console.log(this.CursoForm.value);
    let id = this.route.snapshot.paramMap.get('id');
    if (id != null) {
      this.cursosservice.update(id, this.CursoForm.value).subscribe(response => {
        console.log("UPDATE ",response);
      });
    }else{
      this.cursosservice.add(this.CursoForm.value).subscribe(response => {
        
        console.log("ADD ",response);
      });
    }
    this.router.navigate(['/cursos_index']);
  }


  private getList() {
    this.cursosservice.getList().subscribe(response => {
      this.list=response;
    });
  }
  
  delete(cursos_id) {
    console.log("delete:"+cursos_id);
    this.cursosservice.delete(cursos_id).subscribe(response => {
      console.log("de = " + JSON.stringify(response));
      this.getList();
    });
  }
  refresh(): void{
    window.location.reload();
}

}
