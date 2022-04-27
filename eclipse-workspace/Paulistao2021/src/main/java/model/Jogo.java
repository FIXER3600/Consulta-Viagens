package model;

public class Jogo {
		private int CodigoTimeA;
		private int CodigoTimeB;
		private int GolsTimeA;
		private int GolsTimeB;
		private String Data;
		
		public int getCodigoTimeA() {
			return CodigoTimeA;
		}
		public void setCodigoTimeA(int codigoTimeA) {
			CodigoTimeA = codigoTimeA;
		}
		public int getCodigoTimeB() {
			return CodigoTimeB;
		}
		public void setCodigoTimeB(int codigoTimeB) {
			CodigoTimeB = codigoTimeB;
		}
		public int getGolsTimeA() {
			return GolsTimeA;
		}
		public void setGolsTimeA(int golsTimeA) {
			GolsTimeA = golsTimeA;
		}
		public int getGolsTimeB() {
			return GolsTimeB;
		}
		public void setGolsTimeB(int golsTimeB) {
			GolsTimeB = golsTimeB;
		}
		public String getData() {
			return Data;
		}
		public void setData(String data) {
			Data = data;
		}
		@Override
		public String toString() {
			return "Jogo [CodigoTimeA=" + CodigoTimeA + ", CodigoTimeB=" + CodigoTimeB + ", GolsTimeA=" + GolsTimeA
					+ ", GolsTimeB=" + GolsTimeB + ", Data=" + Data + "]";
		}
		
		
}
