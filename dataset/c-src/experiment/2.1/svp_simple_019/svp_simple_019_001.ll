; ModuleID = 'svp_simple_019_001.bc'
source_filename = "./svp_simple_019_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_019_001_global_condition1 = global i32 1, align 4
@svp_simple_019_001_global_condiiton2 = global i32 1, align 4
@svp_simple_019_001_global_condition3 = global i32 1, align 4
@svp_simple_019_001_global_para1 = common global i32 0, align 4
@svp_simple_019_001_global_para2 = common global i32 0, align 4
@svp_simple_019_001_global_para3 = common global i32 0, align 4
@svp_simple_019_001_global_var1 = common global i32 0, align 4
@svp_simple_019_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_019_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = bitcast i32* %1 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3, !dbg !10
  %7 = bitcast i32* %2 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3, !dbg !10
  %8 = bitcast i32* %3 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !10
  %9 = bitcast i32* %4 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #3, !dbg !10
  %10 = bitcast i32* %5 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !10
  call void (...) @init(), !dbg !11
  %11 = call i32 (...) @rand(), !dbg !12
  %12 = srem i32 %11, 10, !dbg !13
  store volatile i32 %12, i32* @svp_simple_019_001_global_para1, align 4, !dbg !14, !tbaa !15
  %13 = call i32 (...) @rand(), !dbg !19
  %14 = srem i32 %13, 10, !dbg !20
  store volatile i32 %14, i32* @svp_simple_019_001_global_para2, align 4, !dbg !21, !tbaa !15
  %15 = call i32 (...) @rand(), !dbg !22
  %16 = srem i32 %15, 10, !dbg !23
  store volatile i32 %16, i32* @svp_simple_019_001_global_para3, align 4, !dbg !24, !tbaa !15
  %17 = call i32 (...) @rand(), !dbg !25
  store volatile i32 %17, i32* @svp_simple_019_001_global_var1, align 4, !dbg !26, !tbaa !15
  %18 = load volatile i32, i32* @svp_simple_019_001_global_para1, align 4, !dbg !27, !tbaa !15
  %19 = load volatile i32, i32* @svp_simple_019_001_global_para3, align 4, !dbg !28, !tbaa !15
  %20 = add nsw i32 %18, %19, !dbg !29
  %21 = load volatile i32, i32* @svp_simple_019_001_global_para2, align 4, !dbg !30, !tbaa !15
  %22 = icmp sgt i32 %20, %21, !dbg !31
  br i1 %22, label %23, label %25, !dbg !32

23:                                               ; preds = %0
  %24 = load volatile i32, i32* @svp_simple_019_001_global_var2, align 4, !dbg !33, !tbaa !15
  store i32 %24, i32* %1, align 4, !dbg !34, !tbaa !15
  br label %25, !dbg !35

25:                                               ; preds = %23, %0
  %26 = load volatile i32, i32* @svp_simple_019_001_global_var2, align 4, !dbg !36, !tbaa !15
  store i32 %26, i32* %2, align 4, !dbg !37, !tbaa !15
  %27 = load volatile i32, i32* @svp_simple_019_001_global_condition1, align 4, !dbg !38, !tbaa !15
  %28 = icmp eq i32 %27, 1, !dbg !39
  br i1 %28, label %29, label %34, !dbg !40

29:                                               ; preds = %25
  %30 = load volatile i32, i32* @svp_simple_019_001_global_condiiton2, align 4, !dbg !41, !tbaa !15
  %31 = icmp eq i32 %30, 1, !dbg !42
  br i1 %31, label %32, label %34, !dbg !43

32:                                               ; preds = %29
  %33 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !44, !tbaa !15
  store i32 %33, i32* %3, align 4, !dbg !45, !tbaa !15
  br label %34, !dbg !46

34:                                               ; preds = %32, %29, %25
  call void (...) @idlerun(), !dbg !47
  call void @disable_isr(i32 1), !dbg !48
  %35 = load volatile i32, i32* @svp_simple_019_001_global_condition1, align 4, !dbg !49, !tbaa !15
  %36 = icmp eq i32 %35, 1, !dbg !50
  br i1 %36, label %37, label %42, !dbg !51

37:                                               ; preds = %34
  %38 = load volatile i32, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !52, !tbaa !15
  %39 = icmp eq i32 %38, 1, !dbg !53
  br i1 %39, label %40, label %42, !dbg !54

40:                                               ; preds = %37
  %41 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !55, !tbaa !15
  store i32 %41, i32* %4, align 4, !dbg !56, !tbaa !15
  br label %42, !dbg !57

42:                                               ; preds = %40, %37, %34
  call void @enable_isr(i32 1), !dbg !58
  call void (...) @idlerun(), !dbg !59
  call void @disable_isr(i32 1), !dbg !60
  %43 = load volatile i32, i32* @svp_simple_019_001_global_condiiton2, align 4, !dbg !61, !tbaa !15
  %44 = icmp eq i32 %43, 1, !dbg !62
  br i1 %44, label %45, label %50, !dbg !63

45:                                               ; preds = %42
  %46 = load volatile i32, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !64, !tbaa !15
  %47 = icmp eq i32 %46, 0, !dbg !65
  br i1 %47, label %48, label %50, !dbg !66

48:                                               ; preds = %45
  %49 = load volatile i32, i32* @svp_simple_019_001_global_var1, align 4, !dbg !67, !tbaa !15
  store i32 %49, i32* %5, align 4, !dbg !68, !tbaa !15
  br label %50, !dbg !69

50:                                               ; preds = %48, %45, %42
  call void @enable_isr(i32 1), !dbg !70
  %51 = bitcast i32* %5 to i8*, !dbg !71
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %51) #3, !dbg !71
  %52 = bitcast i32* %4 to i8*, !dbg !71
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %52) #3, !dbg !71
  %53 = bitcast i32* %3 to i8*, !dbg !71
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %53) #3, !dbg !71
  %54 = bitcast i32* %2 to i8*, !dbg !71
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %54) #3, !dbg !71
  %55 = bitcast i32* %1 to i8*, !dbg !71
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %55) #3, !dbg !71
  ret void, !dbg !71
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare void @init(...) #2

declare i32 @rand(...) #2

declare void @idlerun(...) #2

declare void @disable_isr(i32) #2

declare void @enable_isr(i32) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_019_001_isr_1() #0 !dbg !72 {
  call void (...) @idlerun(), !dbg !73
  %1 = load volatile i32, i32* @svp_simple_019_001_global_para1, align 4, !dbg !74, !tbaa !15
  %2 = load volatile i32, i32* @svp_simple_019_001_global_para3, align 4, !dbg !75, !tbaa !15
  %3 = add nsw i32 %1, %2, !dbg !76
  %4 = load volatile i32, i32* @svp_simple_019_001_global_para2, align 4, !dbg !77, !tbaa !15
  %5 = icmp slt i32 %3, %4, !dbg !78
  br i1 %5, label %6, label %7, !dbg !79

6:                                                ; preds = %0
  store volatile i32 85, i32* @svp_simple_019_001_global_var2, align 4, !dbg !80, !tbaa !15
  br label %7, !dbg !81

7:                                                ; preds = %6, %0
  store volatile i32 0, i32* @svp_simple_019_001_global_condition3, align 4, !dbg !82, !tbaa !15
  store volatile i32 1, i32* @svp_simple_019_001_global_var1, align 4, !dbg !83, !tbaa !15
  ret void, !dbg !84
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_019_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_019")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_019_001_main", scope: !8, file: !8, line: 30, type: !9, scopeLine: 30, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_019_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_019")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 31, column: 3, scope: !7)
!11 = !DILocation(line: 32, column: 3, scope: !7)
!12 = !DILocation(line: 33, column: 37, scope: !7)
!13 = !DILocation(line: 33, column: 44, scope: !7)
!14 = !DILocation(line: 33, column: 35, scope: !7)
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C/C++ TBAA"}
!19 = !DILocation(line: 34, column: 37, scope: !7)
!20 = !DILocation(line: 34, column: 44, scope: !7)
!21 = !DILocation(line: 34, column: 35, scope: !7)
!22 = !DILocation(line: 35, column: 37, scope: !7)
!23 = !DILocation(line: 35, column: 44, scope: !7)
!24 = !DILocation(line: 35, column: 35, scope: !7)
!25 = !DILocation(line: 37, column: 36, scope: !7)
!26 = !DILocation(line: 37, column: 34, scope: !7)
!27 = !DILocation(line: 39, column: 8, scope: !7)
!28 = !DILocation(line: 39, column: 42, scope: !7)
!29 = !DILocation(line: 39, column: 40, scope: !7)
!30 = !DILocation(line: 39, column: 77, scope: !7)
!31 = !DILocation(line: 39, column: 75, scope: !7)
!32 = !DILocation(line: 39, column: 7, scope: !7)
!33 = !DILocation(line: 40, column: 15, scope: !7)
!34 = !DILocation(line: 40, column: 13, scope: !7)
!35 = !DILocation(line: 40, column: 5, scope: !7)
!36 = !DILocation(line: 42, column: 13, scope: !7)
!37 = !DILocation(line: 42, column: 11, scope: !7)
!38 = !DILocation(line: 44, column: 8, scope: !7)
!39 = !DILocation(line: 44, column: 45, scope: !7)
!40 = !DILocation(line: 44, column: 51, scope: !7)
!41 = !DILocation(line: 44, column: 55, scope: !7)
!42 = !DILocation(line: 44, column: 92, scope: !7)
!43 = !DILocation(line: 44, column: 7, scope: !7)
!44 = !DILocation(line: 45, column: 15, scope: !7)
!45 = !DILocation(line: 45, column: 13, scope: !7)
!46 = !DILocation(line: 45, column: 5, scope: !7)
!47 = !DILocation(line: 46, column: 3, scope: !7)
!48 = !DILocation(line: 47, column: 3, scope: !7)
!49 = !DILocation(line: 48, column: 8, scope: !7)
!50 = !DILocation(line: 48, column: 45, scope: !7)
!51 = !DILocation(line: 48, column: 51, scope: !7)
!52 = !DILocation(line: 48, column: 55, scope: !7)
!53 = !DILocation(line: 48, column: 92, scope: !7)
!54 = !DILocation(line: 48, column: 7, scope: !7)
!55 = !DILocation(line: 49, column: 15, scope: !7)
!56 = !DILocation(line: 49, column: 13, scope: !7)
!57 = !DILocation(line: 49, column: 5, scope: !7)
!58 = !DILocation(line: 50, column: 3, scope: !7)
!59 = !DILocation(line: 51, column: 3, scope: !7)
!60 = !DILocation(line: 52, column: 3, scope: !7)
!61 = !DILocation(line: 53, column: 8, scope: !7)
!62 = !DILocation(line: 53, column: 45, scope: !7)
!63 = !DILocation(line: 53, column: 51, scope: !7)
!64 = !DILocation(line: 53, column: 55, scope: !7)
!65 = !DILocation(line: 53, column: 92, scope: !7)
!66 = !DILocation(line: 53, column: 7, scope: !7)
!67 = !DILocation(line: 54, column: 15, scope: !7)
!68 = !DILocation(line: 54, column: 13, scope: !7)
!69 = !DILocation(line: 54, column: 5, scope: !7)
!70 = !DILocation(line: 55, column: 3, scope: !7)
!71 = !DILocation(line: 56, column: 1, scope: !7)
!72 = distinct !DISubprogram(name: "svp_simple_019_001_isr_1", scope: !8, file: !8, line: 58, type: !9, scopeLine: 58, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 59, column: 3, scope: !72)
!74 = !DILocation(line: 60, column: 8, scope: !72)
!75 = !DILocation(line: 60, column: 42, scope: !72)
!76 = !DILocation(line: 60, column: 40, scope: !72)
!77 = !DILocation(line: 60, column: 77, scope: !72)
!78 = !DILocation(line: 60, column: 75, scope: !72)
!79 = !DILocation(line: 60, column: 7, scope: !72)
!80 = !DILocation(line: 61, column: 36, scope: !72)
!81 = !DILocation(line: 61, column: 5, scope: !72)
!82 = !DILocation(line: 63, column: 40, scope: !72)
!83 = !DILocation(line: 65, column: 34, scope: !72)
!84 = !DILocation(line: 66, column: 1, scope: !72)
