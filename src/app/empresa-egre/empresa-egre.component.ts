import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';

import { FormGroup, FormBuilder, Validators } from '@angular/forms';

import { EmpresaService } from '../services/empresa.service';

@Component({
  selector: 'app-empresa-egre',
  templateUrl: './empresa-egre.component.html',
  styleUrls: ['./empresa-egre.component.css']
})
export class EmpresaEgreComponent implements OnInit {

  empresaForm: FormGroup;
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private formBuild: FormBuilder,
    private empresaservice: EmpresaService,
  ) {
  }
  ngOnInit() {
    this.empresaForm = this.formBuild.group({
      
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
        this.empresaForm.setValue(response);
        console.log(response);
      });
    }

  }
  

}
