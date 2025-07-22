; ModuleID = 'svp_simple_010_001_new.ll'
source_filename = "svp_simple_010_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

%union.pack1 = type { i32 }
%struct.pack2 = type { i8, i32 }

@svp_simple_010_001_global_union = common global %union.pack1 zeroinitializer, align 4, !dbg !0
@svp_simple_010_001_global_struct = common global %struct.pack2 zeroinitializer, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_010_001_main() local_unnamed_addr #0 !dbg !27 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void (...) @init(), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %1, metadata !31, metadata !DIExpression()), !dbg !33
  store i32 1, i32* %1, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %2, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 2, i32* %2, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32* %3, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 3, i32* %3, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %4, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 4, i32* %4, align 4, !dbg !39
  %5 = load i32, i32* %1, align 4, !dbg !40
  %6 = trunc i32 %5 to i8, !dbg !40
  store volatile i8 %6, i8* bitcast (%union.pack1* @svp_simple_010_001_global_union to i8*), align 4, !dbg !41
  %7 = load i32, i32* %2, align 4, !dbg !42
  store volatile i32 %7, i32* getelementptr inbounds (%union.pack1, %union.pack1* @svp_simple_010_001_global_union, i32 0, i32 0), align 4, !dbg !43
  %8 = load i32, i32* %3, align 4, !dbg !44
  %9 = trunc i32 %8 to i8, !dbg !44
  store volatile i8 %9, i8* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 0), align 4, !dbg !45
  %10 = load i32, i32* %4, align 4, !dbg !46
  store volatile i32 %10, i32* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 1), align 4, !dbg !47
  ret void, !dbg !48
}

declare void @init(...) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_010_001_isr_1() local_unnamed_addr #0 !dbg !49 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @idlerun(), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %1, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i32* %2, metadata !53, metadata !DIExpression()), !dbg !54
  %3 = load volatile i8, i8* bitcast (%union.pack1* @svp_simple_010_001_global_union to i8*), align 4, !dbg !55
  %4 = zext i8 %3 to i32, !dbg !56
  store i32 %4, i32* %1, align 4, !dbg !57
  %5 = load volatile i8, i8* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 0), align 4, !dbg !58
  %6 = zext i8 %5 to i32, !dbg !59
  store i32 %6, i32* %2, align 4, !dbg !60
  ret void, !dbg !61
}

declare void @idlerun(...) local_unnamed_addr #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_010_001_global_union", scope: !2, file: !3, line: 14, type: !16, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "svp_simple_010_001.c", directory: "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_010")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_010_001_global_struct", scope: !2, file: !3, line: 15, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !9)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "svp_simple_010_001_struct", file: !3, line: 12, baseType: !10)
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pack2", file: !3, line: 9, size: 64, elements: !11)
!11 = !{!12, !14}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "header", scope: !10, file: !3, line: 10, baseType: !13, size: 8)
!13 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !10, file: !3, line: 11, baseType: !15, size: 32, offset: 32)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "svp_simple_010_001_union", file: !3, line: 7, baseType: !18)
!18 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pack1", file: !3, line: 4, size: 32, elements: !19)
!19 = !{!20, !21}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "header", scope: !18, file: !3, line: 5, baseType: !13, size: 8)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !18, file: !3, line: 6, baseType: !15, size: 32)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{!"clang version 10.0.0 "}
!27 = distinct !DISubprogram(name: "svp_simple_010_001_main", scope: !3, file: !3, line: 17, type: !28, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocation(line: 18, column: 3, scope: !27)
!31 = !DILocalVariable(name: "svp_simple_010_001_local_var1", scope: !27, file: !3, line: 19, type: !32)
!32 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!33 = !DILocation(line: 19, column: 7, scope: !27)
!34 = !DILocalVariable(name: "svp_simple_010_001_local_var2", scope: !27, file: !3, line: 20, type: !32)
!35 = !DILocation(line: 20, column: 7, scope: !27)
!36 = !DILocalVariable(name: "svp_simple_010_001_local_var3", scope: !27, file: !3, line: 22, type: !32)
!37 = !DILocation(line: 22, column: 7, scope: !27)
!38 = !DILocalVariable(name: "svp_simple_010_001_local_var4", scope: !27, file: !3, line: 23, type: !32)
!39 = !DILocation(line: 23, column: 7, scope: !27)
!40 = !DILocation(line: 25, column: 44, scope: !27)
!41 = !DILocation(line: 25, column: 42, scope: !27)
!42 = !DILocation(line: 26, column: 42, scope: !27)
!43 = !DILocation(line: 26, column: 40, scope: !27)
!44 = !DILocation(line: 28, column: 45, scope: !27)
!45 = !DILocation(line: 28, column: 43, scope: !27)
!46 = !DILocation(line: 29, column: 43, scope: !27)
!47 = !DILocation(line: 29, column: 41, scope: !27)
!48 = !DILocation(line: 30, column: 1, scope: !27)
!49 = distinct !DISubprogram(name: "svp_simple_010_001_isr_1", scope: !3, file: !3, line: 32, type: !28, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DILocation(line: 33, column: 3, scope: !49)
!51 = !DILocalVariable(name: "reader1", scope: !49, file: !3, line: 34, type: !32)
!52 = !DILocation(line: 34, column: 7, scope: !49)
!53 = !DILocalVariable(name: "reader2", scope: !49, file: !3, line: 34, type: !32)
!54 = !DILocation(line: 34, column: 16, scope: !49)
!55 = !DILocation(line: 36, column: 45, scope: !49)
!56 = !DILocation(line: 36, column: 13, scope: !49)
!57 = !DILocation(line: 36, column: 11, scope: !49)
!58 = !DILocation(line: 38, column: 46, scope: !49)
!59 = !DILocation(line: 38, column: 13, scope: !49)
!60 = !DILocation(line: 38, column: 11, scope: !49)
!61 = !DILocation(line: 39, column: 1, scope: !49)
