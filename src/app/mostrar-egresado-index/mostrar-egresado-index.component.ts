import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { EgresadoService } from '../services/egresado.service';

@Component({
  selector: 'app-mostrar-egresado-index',
  templateUrl: './mostrar-egresado-index.component.html',
  styleUrls: ['./mostrar-egresado-index.component.css']
})
export class MostrarEgresadoIndexComponent implements OnInit {

  filterPost = '';
  list;
  EgresadoForm: FormGroup;
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private formBuild: FormBuilder,
    private egresadoService: EgresadoService,
    
  ) {
    this.getList();
  }


  ngOnInit() {
    this.getList();
    this.EgresadoForm = this.formBuild.group({
      
      egresado_id: [''],
      egresado_nombre: ['', [Validators.required]],
      egresado_ap_materno: ['', [Validators.required]],
      egresado_ap_paterno: ['', [Validators.required]],
      egresado_estado: ['', [Validators.required]],
      egresado_dni: ['', [Validators.required]],
      egresado_fecha_nacimiento: ['', [Validators.required]],
      egresado_celular: ['', [Validators.required]],
      egresado_codigo: ['', [Validators.required]],
      roles_id: ['', [Validators.required]],
      ep_id: ['', [Validators.required]],
    });
    //get data
    let egresado_id = this.route.snapshot.paramMap.get('id');
    if (egresado_id != null) {
      this.egresadoService.getById(egresado_id).subscribe(response => {
        this.EgresadoForm.setValue(response);
        console.log(response);
      });
    }
  }
  private getList() {
    this.egresadoService.getList().subscribe(response => {
      this.list=response;
    });
  }
  delete(egresado_id) {
    console.log("delete:"+egresado_id);
    this.egresadoService.delete(egresado_id).subscribe(response => {
      console.log("de = " + JSON.stringify(response));
      this.getList();
    });
  }
  save() {
    console.log(this.EgresadoForm.value);
    let id = this.route.snapshot.paramMap.get('id');
    if (id != null) {
      this.egresadoService.update(id, this.EgresadoForm.value).subscribe(response => {
        console.log("UPDATE ",response);
      });
    }else{
      this.egresadoService.add(this.EgresadoForm.value).subscribe(response => {
        console.log("ADD ",response);
      });
    }
    this.router.navigate(['/mostraregresadosindex']);
  }

}