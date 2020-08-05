import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { EmpresaService } from '../services/empresa.service';

@Component({
  selector: 'app-empresa-index',
  templateUrl: './empresa-index.component.html',
  styleUrls: ['./empresa-index.component.css']
})
export class EmpresaIndexComponent implements OnInit {


  list;
  empresaForm: FormGroup;
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private formBuild: FormBuilder,
    private empresaservice: EmpresaService,
  ) {
    this.getList();
  }
  ngOnInit() {
    this.getList();
    this.empresaForm = this.formBuild.group({
      
      empresa_id: [''],
      empresa_nombre: ['', [Validators.required]],
      empresa_correo: ['', [Validators.required]],
      empresa_direccion: ['', [Validators.required]],
      empresa_telefono: ['', [Validators.required]],
      empresa_rubro: ['', [Validators.required]],
      egresado_id: ['', [Validators.required]],

    });
    //get data
    let empresa_id = this.route.snapshot.paramMap.get('id');
    if (empresa_id != null) {
      this.empresaservice.getById(empresa_id).subscribe(response => {
        this.empresaForm.setValue(response);
        console.log(response);
      });
    }
  }
  private getList() {
    this.empresaservice.getList().subscribe(response => {
      this.list=response;
    });
  }
  delete(empresa_id) {
    console.log("delete:"+empresa_id);
    this.empresaservice.delete(empresa_id).subscribe(response => {
      console.log("de = " + JSON.stringify(response));
      this.getList();
    });
  }

  save() {
    console.log(this.empresaForm.value);
    let id = this.route.snapshot.paramMap.get('id');
    if (id != null) {
      this.empresaservice.update(id, this.empresaForm.value).subscribe(response => {
        console.log("UPDATE ",response);
      });
    }else{
      this.empresaservice.add(this.empresaForm.value).subscribe(response => {
        console.log("ADD ",response);
      });
    }
    this.router.navigate(['/empresa_index']);
  }


}
