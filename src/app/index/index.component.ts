import { Component, OnInit } from '@angular/core';

import { Router, ActivatedRoute, ParamMap } from '@angular/router';

import { FormGroup, FormBuilder, Validators } from '@angular/forms';

import { EmpresaService } from '../services/empresa.service';

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css']
})
export class IndexComponent implements OnInit {

  empresaForm1: FormGroup;
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private formBuild: FormBuilder,
    private empresaservice: EmpresaService,
  ) {
  }
  ngOnInit() {
    this.empresaForm1 = this.formBuild.group({
      
      empresa_id: ['', [Validators.required]],
      empresa_nombre: ['', [Validators.required]],
      empresa_correo: ['', [Validators.required]],
      empresa_direccion: ['', [Validators.required]],
      empresa_telefono: ['', [Validators.required]],
      empresa_rubro: ['', [Validators.required]],
      egresado_id: ['', [Validators.required]],

    });
    //get data
    let egresado_id = this.route.snapshot.paramMap.get('id');
    if (egresado_id != null) {
      this.empresaservice.getByIdeg(egresado_id).subscribe(response => {
        this.empresaForm1.setValue(response);
        console.log(response); 
      });
    }

  }
  save() {
    console.log(this.empresaForm1.value);
    let id = this.route.snapshot.paramMap.get('id');
    if (id != null) {
      this.empresaservice.update(id, this.empresaForm1.value).subscribe(response => {
        console.log("UPDATE ",response);
      });
    }else{
      this.empresaservice.add(this.empresaForm1.value).subscribe(response => {
        console.log("ADD ",response);
      });
    }
    this.router.navigate(['/empresa_index']);
  }

}
