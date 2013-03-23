package wiki

import org.xwiki.rendering.block.Block
import org.xwiki.rendering.block.TableBlock
import org.xwiki.rendering.transformation.AbstractTransformation
import org.xwiki.rendering.transformation.TransformationContext
import org.xwiki.rendering.transformation.TransformationException

/**
 * Adds classes 'table' and 'table-bordered' to all tables
 *
 * @author Anton Gnutov
 */
class TableTransformation extends AbstractTransformation {
    @Override
    void transform(Block block, TransformationContext transformationContext) throws TransformationException {
        updateTableRecursively(block)
    }

    private void updateTableRecursively(Block block) {
        if (block instanceof TableBlock) {
            block.setParameter("class", "table table-bordered")
        } else {
            block.children.each {child ->
                updateTableRecursively(child)
            }
        }
    }
}
