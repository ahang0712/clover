; ModuleID = 'svp_simple_022_001.bc'
source_filename = "./svp_simple_022_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_022_001_global_var1 = common global i32 0, align 4
@svp_simple_022_001_global_array = common global [256 x i32] zeroinitializer, align 16
@svp_simple_022_001_global_var3 = common global i32 0, align 4
@svp_simple_022_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  call void @svp_simple_022_001_init(), !dbg !10
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !11, !tbaa !12
  call void @svp_simple_022_001_func_1(), !dbg !16
  %2 = bitcast i32* %1 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !17
  store i32 0, i32* %1, align 4, !dbg !18, !tbaa !12
  br label %3, !dbg !19

3:                                                ; preds = %10, %0
  %4 = load i32, i32* %1, align 4, !dbg !20, !tbaa !12
  %5 = icmp slt i32 %4, 256, !dbg !21
  br i1 %5, label %6, label %13, !dbg !22

6:                                                ; preds = %3
  %7 = load i32, i32* %1, align 4, !dbg !23, !tbaa !12
  %8 = sext i32 %7 to i64, !dbg !24
  %9 = getelementptr inbounds [256 x i32], [256 x i32]* @svp_simple_022_001_global_array, i64 0, i64 %8, !dbg !24
  store volatile i32 0, i32* %9, align 4, !dbg !25, !tbaa !12
  br label %10, !dbg !26

10:                                               ; preds = %6
  %11 = load i32, i32* %1, align 4, !dbg !27, !tbaa !12
  %12 = add nsw i32 %11, 1, !dbg !27
  store i32 %12, i32* %1, align 4, !dbg !27, !tbaa !12
  br label %3, !dbg !22, !llvm.loop !28

13:                                               ; preds = %3
  call void @svp_simple_022_001_func_2(), !dbg !29
  %14 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !30, !tbaa !12
  store volatile i32 %14, i32* @svp_simple_022_001_global_var3, align 4, !dbg !31, !tbaa !12
  %15 = bitcast i32* %1 to i8*, !dbg !32
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #3, !dbg !32
  ret void, !dbg !32
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_init() #0 !dbg !33 {
  %1 = call i32 (...) @rand(), !dbg !34
  store volatile i32 %1, i32* @svp_simple_022_001_global_var1, align 4, !dbg !35, !tbaa !12
  %2 = call i32 (...) @rand(), !dbg !36
  store volatile i32 %2, i32* @svp_simple_022_001_global_var2, align 4, !dbg !37, !tbaa !12
  %3 = call i32 (...) @rand(), !dbg !38
  store volatile i32 %3, i32* @svp_simple_022_001_global_var3, align 4, !dbg !39, !tbaa !12
  call void (...) @init(), !dbg !40
  ret void, !dbg !41
}

declare i32 @rand(...) #2

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_1() #0 !dbg !42 {
  call void @svp_simple_022_001_func_3(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_2() #0 !dbg !45 {
  call void @svp_simple_022_001_func_4(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_3() #0 !dbg !48 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !49, !tbaa !12
  %2 = icmp sge i32 %1, 12, !dbg !50
  br i1 %2, label %3, label %4, !dbg !49

3:                                                ; preds = %0
  store volatile i32 12, i32* @svp_simple_022_001_global_var1, align 4, !dbg !51, !tbaa !12
  br label %5, !dbg !52

4:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !53, !tbaa !12
  br label %5

5:                                                ; preds = %4, %3
  ret void, !dbg !54
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_func_4() #0 !dbg !55 {
  %1 = load volatile i32, i32* @svp_simple_022_001_global_var1, align 4, !dbg !56, !tbaa !12
  store volatile i32 %1, i32* @svp_simple_022_001_global_var3, align 4, !dbg !57, !tbaa !12
  ret void, !dbg !58
}

; Function Attrs: nounwind uwtable
define void @svp_simple_022_001_isr_1() #0 !dbg !59 {
  store volatile i32 0, i32* @svp_simple_022_001_global_var1, align 4, !dbg !60, !tbaa !12
  ret void, !dbg !61
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_022_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_022")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_022_001_main", scope: !8, file: !8, line: 29, type: !9, scopeLine: 29, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_022_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_022")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 30, column: 3, scope: !7)
!11 = !DILocation(line: 32, column: 34, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 33, column: 3, scope: !7)
!17 = !DILocation(line: 34, column: 3, scope: !7)
!18 = !DILocation(line: 35, column: 10, scope: !7)
!19 = !DILocation(line: 35, column: 8, scope: !7)
!20 = !DILocation(line: 35, column: 15, scope: !7)
!21 = !DILocation(line: 35, column: 17, scope: !7)
!22 = !DILocation(line: 35, column: 3, scope: !7)
!23 = !DILocation(line: 36, column: 37, scope: !7)
!24 = !DILocation(line: 36, column: 5, scope: !7)
!25 = !DILocation(line: 36, column: 40, scope: !7)
!26 = !DILocation(line: 37, column: 3, scope: !7)
!27 = !DILocation(line: 35, column: 25, scope: !7)
!28 = distinct !{!28, !22, !26}
!29 = !DILocation(line: 38, column: 3, scope: !7)
!30 = !DILocation(line: 39, column: 36, scope: !7)
!31 = !DILocation(line: 39, column: 34, scope: !7)
!32 = !DILocation(line: 40, column: 1, scope: !7)
!33 = distinct !DISubprogram(name: "svp_simple_022_001_init", scope: !8, file: !8, line: 42, type: !9, scopeLine: 42, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!34 = !DILocation(line: 43, column: 36, scope: !33)
!35 = !DILocation(line: 43, column: 34, scope: !33)
!36 = !DILocation(line: 44, column: 36, scope: !33)
!37 = !DILocation(line: 44, column: 34, scope: !33)
!38 = !DILocation(line: 45, column: 36, scope: !33)
!39 = !DILocation(line: 45, column: 34, scope: !33)
!40 = !DILocation(line: 47, column: 3, scope: !33)
!41 = !DILocation(line: 48, column: 1, scope: !33)
!42 = distinct !DISubprogram(name: "svp_simple_022_001_func_1", scope: !8, file: !8, line: 50, type: !9, scopeLine: 50, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 50, column: 36, scope: !42)
!44 = !DILocation(line: 50, column: 65, scope: !42)
!45 = distinct !DISubprogram(name: "svp_simple_022_001_func_2", scope: !8, file: !8, line: 52, type: !9, scopeLine: 52, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 52, column: 36, scope: !45)
!47 = !DILocation(line: 52, column: 65, scope: !45)
!48 = distinct !DISubprogram(name: "svp_simple_022_001_func_3", scope: !8, file: !8, line: 54, type: !9, scopeLine: 54, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 55, column: 7, scope: !48)
!50 = !DILocation(line: 55, column: 38, scope: !48)
!51 = !DILocation(line: 56, column: 36, scope: !48)
!52 = !DILocation(line: 57, column: 3, scope: !48)
!53 = !DILocation(line: 58, column: 36, scope: !48)
!54 = !DILocation(line: 60, column: 1, scope: !48)
!55 = distinct !DISubprogram(name: "svp_simple_022_001_func_4", scope: !8, file: !8, line: 62, type: !9, scopeLine: 62, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 63, column: 36, scope: !55)
!57 = !DILocation(line: 63, column: 34, scope: !55)
!58 = !DILocation(line: 64, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "svp_simple_022_001_isr_1", scope: !8, file: !8, line: 65, type: !9, scopeLine: 65, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 66, column: 34, scope: !59)
!61 = !DILocation(line: 67, column: 1, scope: !59)
