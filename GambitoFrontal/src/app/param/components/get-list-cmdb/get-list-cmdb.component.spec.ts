import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GetListCmdbComponent } from './get-list-cmdb.component';

describe('GetListCmdbComponent', () => {
  let component: GetListCmdbComponent;
  let fixture: ComponentFixture<GetListCmdbComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GetListCmdbComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GetListCmdbComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
