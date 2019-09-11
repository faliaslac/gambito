export interface MOPR {
  Id_MOPR: number;
  Id_VEPR: number;
  Codigo: number;
  Padre: number;
  Nivel: number;
  Descripcion: string;
  ImportePresupuesto: number;
  ImporteFacturado: number;
}

export interface MOPRampliado {
  Id_MOPR: number;
  Id_VEPR: number;
  Codigo: number;
  Padre: number;
  Nivel: number;
  Descripcion: string;
  ImportePresupuesto: number;
  ImporteFacturado: number;
  DESPAPR: string;
  DESTIPR: string;
  Year: string;
}


