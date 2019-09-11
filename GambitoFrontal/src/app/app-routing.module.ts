// en este módulo se enlazan los nmotécnicos que se han indicado en los enlaces del menú con sus respectivos componentes

import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { GetTIPRComponent } from './param/components/get-tipr/get-tipr.component';
import { GetListTiprComponent } from './param/components/get-list-tipr/get-list-tipr.component';
import { GetListPaprComponent } from './param/components/get-list-papr/get-list-papr.component';
import { GetListCentroComponent } from './param/components/get-list-centros/get-list-centros.component';
import { GetListCMDBComponent } from './param/components/get-list-cmdb/get-list-cmdb.component';
import { NuevaVersionComponent } from './presupuesto/componentes/nueva-version/nueva-version.component';
import { CierrePptoComponent } from './presupuesto/componentes/cierre-ppto/cierre-ppto.component';
import { CargaPptoComponent } from './presupuesto/componentes/carga-ppto/carga-ppto.component';
import { AnalisisCentrosComponent } from './seguimiento/components/analisis-centros/analisis-centros.component';
import { AnalisisCMDBComponent } from './seguimiento/components/analisis-cmdb/analisis-cmdb.component';
import { AnalisisProveedorComponent } from './seguimiento/components/analisis-proveedor/analisis-proveedor.component';
import { SeguiPresuComponent } from './seguimiento/components/segui-presu/segui-presu.component';
import { FacturasComponent } from './contable/components/facturas/facturas.component';
import { AyudaContableComponent } from './contable/components/ayuda-contable/ayuda-contable.component';
import { GetListProveedorComponent } from './param/components/get-list-proveedor/get-list-proveedor.component';
import { AyudaParamComponent } from './param/components/ayuda-param/ayuda-param.component';
import { AyudaPresuComponent } from './presupuesto/componentes/ayuda-presu/ayuda-presu.component';
import { AyudaSeguiComponent } from './seguimiento/components/ayuda-segui/ayuda-segui.component';
import { RepartoCostesComponent } from './contable/components/reparto-costes/reparto-costes.component';
import { GetListNIPRComponent } from './param/components/get-list-nipr/get-list-nipr.component';



const routes: Routes = [
  {path: 'linkCMDB', component: GetListCMDBComponent},
  {path: 'linkCentros', component: GetListCentroComponent},
  {path: 'listaTIPR', component: GetListTiprComponent},
  {path: 'listaPAPR', component: GetListPaprComponent},
  {path: 'linkPresuNver', component: NuevaVersionComponent },
  {path: 'linkPresCierre', component: CierrePptoComponent },
  {path: 'linkPresCarga', component: CargaPptoComponent },
  {path: 'AnalisisCMDB', component: AnalisisCMDBComponent },
  {path: 'AnalisisProveedores', component: AnalisisProveedorComponent },
  {path: 'AnalisisCentros', component: AnalisisCentrosComponent },
  {path: 'SegPresup', component: SeguiPresuComponent },
  {path: 'linkFacturas', component: FacturasComponent },
  {path: 'ayudaContable', component: AyudaContableComponent },
  {path: 'Proveedores', component: GetListProveedorComponent },
  {path: 'ayudaParam', component: AyudaParamComponent},
  {path: 'ayudaPresu', component: AyudaPresuComponent},
  {path: 'ayudaSegui', component: AyudaSeguiComponent},
  {path: 'repartoCostes', component: RepartoCostesComponent},
  {path: 'linkNIPR', component: GetListNIPRComponent},




];



@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
