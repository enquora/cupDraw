/**
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @author "Esteban Robles Luna <esteban.roblesluna@gmail.com>"
 */
@implementation GroupCommand : Command
{
}

- (void)undo
{
}

- (void)execute
{
	var tool = [_drawing tool];
	var selectedFigures = [tool selectedFigures];
	
	if ([selectedFigures count] >= 2)
    {
		var frame = [GeometryUtils computeFrameForViews: selectedFigures];
		var figuresTranslation = CGPointMake(-frame.origin.x, -frame.origin.y);
		var group = [GroupFigure frame: frame];
		
		for (var i = 0; i < [selectedFigures count]; i++)
        { 
		    var figure = [selectedFigures objectAtIndex: i];
			[group addFigure: figure];
			[figure translateBy: figuresTranslation];
		}
		
		[_drawing addFigure: group];
		[tool clearSelection];
		[tool select: group];
	}
}
@end
