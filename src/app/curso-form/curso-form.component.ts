import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { CursosService } from '../services/cursos.service';

@Component({
  selector: 'app-curso-form',
  templateUrl: './curso-form.component.html',
  styleUrls: ['./curso-form.component.css']
})
export class CursoFormComponent implements OnInit {

  CursoForm: FormGroup;
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private formBuild: FormBuilder,
    private cursosservice: CursosService,
  ) {
  }
  ngOnInit() {

    this.CursoForm = this.formBuild.group({
      
      cursos_id: ['', [Validators.required]],
      cursos_nombre: ['', [Validators.required]],
      curso_lugar: ['', [Validators.required]],
      curso_fecha: ['', [Validators.required]],
      egresado_id: ['', [Validators.required]],
    });
    //get data
    let cursos_id = this.route.snapshot.paramMap.get('id');
    if (cursos_id != null) {
      this.cursosservice.getById(cursos_id).subscribe(response => {
        this.CursoForm.setValue(response);
        console.log(response);
      });
    }

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

}
