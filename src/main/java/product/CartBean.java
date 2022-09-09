package product;

import java.util.Vector;

public class CartBean {
	private Vector<ProductBean> clist;
	
	public CartBean(){
		clist = new Vector<ProductBean>();
	}
	
	public void addCart(String _pno, String _p_num) {
		ProductDao pd = ProductDao.getInstance();
		ProductBean pb = pd.productByPno(_pno);
		
		int pno = Integer.parseInt(_pno);
		int p_num = Integer.parseInt(_p_num);
		
		for(ProductBean ccomp : clist) {
			if(ccomp.getPno() == pno) {
				ccomp.setP_num( ccomp.getP_num() + p_num);
				ccomp.setTot_price( ccomp.getP_num()*ccomp.getPrice() );
				
				return;
			}
		}
		
		pb.setP_num(p_num);
		pb.setTot_price(pb.getPrice() * p_num);
		
		clist.add(pb);
	}//addCart

	public Vector<ProductBean> getCart(){
		return clist;
	}
	
	public void editCart(String _pno ,String _p_num) {
		int pno = Integer.parseInt(_pno);
		int p_num = Integer.parseInt(_p_num);
		
		for(ProductBean ccomp : clist) {
			if(ccomp.getPno() == pno) {
				ccomp.setP_num(p_num);
				ccomp.setTot_price( p_num * ccomp.getPrice() );
				break;
			}
		}
	}//editCart
	
	public void deleteCart(String _pno) {
		int pno = Integer.parseInt(_pno);
		
		for(ProductBean ccomp : clist) {
			if(ccomp.getPno() == pno) {
				clist.removeElement(ccomp);
				break;
			}
		}
	}
	
}
